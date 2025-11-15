extends Button


func _on_pressed() -> void:
	self.get_parent().get_parent().get_node("main_menu").home()

func disable_scrollbars() -> void:
	var invisible_scrollbar_theme = Theme.new()
	var empty_stylebox = StyleBoxEmpty.new()

	invisible_scrollbar_theme.set_stylebox("scroll", "VScrollBar", empty_stylebox)
	invisible_scrollbar_theme.set_stylebox("scroll", "HScrollBar", empty_stylebox)

	self.get_parent().get_node("ScrollContainer").get_v_scroll_bar().theme = invisible_scrollbar_theme
	self.get_parent().get_node("ScrollContainer").get_h_scroll_bar().theme = invisible_scrollbar_theme

func _ready() -> void:
	disable_scrollbars()
