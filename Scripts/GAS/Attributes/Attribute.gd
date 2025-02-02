extends RefCounted

class_name Attribute

var current_value : float
var base_value : float
var max_value : float

var attribute_name : String
var ownerinfo

signal value_changed


func _init(start_value,owner_info,attributename):
    self.base_value = start_value
    self.current_value = start_value
    self.max_value = start_value
    self.ownerinfo = owner_info
    self.attribute_name = attributename


func set_value(new_value):
    self.current_value = new_value
    value_changed.emit(ownerinfo,self)
    return self

func get_value():
    return self.current_value

func modify_value(value,modifieroperator):
    if modifieroperator == "+":
        self.current_value += value
    elif modifieroperator == "-":
        self.current_value -= value
    elif modifieroperator == "*":
        self.current_value *= value
    elif modifieroperator == "/":
        self.current_value /= value
    else:
        print("Invalid modifier operator")

    value_changed.emit(self,ownerinfo)
    return self

func get_value_scaled():
    return self.current_value / self.max_value