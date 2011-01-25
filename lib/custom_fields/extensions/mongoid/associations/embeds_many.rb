# # encoding: utf-8
# module Mongoid #:nodoc:
#   module Associations #:nodoc:
#     class EmbedsMany < Proxy
#
#       def initialize_with_custom_fields(parent, options, target_array = nil)
#         puts "[initialize_with_custom_fields] parent = #{parent}, \n\t#{options.inspect}, \n\t#{target_array.inspect}"
#
#         if custom_fields?(parent, options.name)
#           options = options.clone # 2 parent instances should not share the exact same option instance
#
#           custom_fields = parent.send(:"ordered_#{custom_fields_association_name(options.name)}")
#
#           klass = options.klass.to_klass_with_custom_fields(custom_fields)
#           klass._parent = parent
#           klass.association_name = options.name
#
#           options.instance_eval <<-EOF
#             def klass=(klass); @klass = klass; end
#             def klass; @klass || class_name.constantize; end
#           EOF
#
#           options.klass = klass
#         end
#
#         initialize_without_custom_fields(parent, options, target_array)
#       end
#
#       alias_method_chain :initialize, :custom_fields
#
#     end
#   end
# end