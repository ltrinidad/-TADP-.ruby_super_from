module SuperFrom

  class Invoker
  end

  def super_from(ancestor_class)
    # ancestor_class representa la clase ancestro a la que quiero pedirle que haga el metodo
    # self.class sera la clase actual del objeto que llama a super_from (puede ser una clase comun o un Modulo)
    # caller_method_name es el nombre del metodo que acaba de invocar a super_from

    caller_method_name = caller[0][/`([^']*)'/, 1] # ESTO ES HORRIBLE

    raise 'La clase o modulo ' + ancestor_class.name + ' no pertenece a la jerarquia' unless belongs_to_hierarchy(ancestor_class)

    #puts 'Pertenece a la jerarquia !'

    invoker_object = Invoker.new.extend(ancestor_class) # Creo que no puedo hacerle include porque ancestor_class puede ser un modulo o una clase

    raise 'La clase o modulo ' + ancestor_class.name + ' no contiene el metodo buscado' unless invoker_object.respond_to? caller_method_name

    #puts 'La clase o modulo contiene el metodo!'

    #puts 'Metodos de invoker: ' + invoker_object.methods.to_s

    invoker_object.send(caller_method_name)

    #puts 'nombre del modulo : ' + ancestor_class.name

  end

  def belongs_to_hierarchy(ancestor_class)
    #puts 'ancestor por array : ' + ancestor_class.ancestors.shift.to_s.tr('[]', '')
    #puts 'ancestor name ' + ancestor_class.name
    #puts 'ancestor class ' + ancestor_class.class.to_s
    #puts 'self.class : ' + self.class.name
    #puts 'ancestors : ' + self.class.ancestors.to_s
    self.class.ancestors.to_s.include? ancestor_class.ancestors.shift.to_s.tr('[]', '')
  end

  def  mi_super_prints(ancestor)
    #method
    #puts 'caller_method_name1 :' +  caller[0][/`([^']*)'/, 1]
    #puts 'caller_method_name2 :' +  caller[0][/`.*'/][1..-2]

    #class
    #class_name = self.caller_class_name
    #puts 'class :' + caller_class_name.class.to_s
    #puts 'ancestors : ' + caller_class_name.class.ancestors.to_s
    #puts 'ancestor is a module ?' + (ancestor.is_a? Module).to_s
    #puts 'ancestors de ancestor : ' + ancestor.ancestors.to_s
    #puts 'ancestor por array : ' + ancestor.ancestors.shift.to_s.tr('[]', '')
    #puts 'aaa' + ancestor
    #puts 'obj : ' + Object.const_get(ancestor).to_s
  end
end

