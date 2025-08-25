local c_r_press_queue = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
    

    local press_node = self.hovering.target or self.focused.target
    if press_node and press_node.right_click then
        press_node:right_click()
    end
    return c_r_press_queue(self, x, y)
end