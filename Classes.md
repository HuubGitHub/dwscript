# Classes #

Classes all derive from the root TObject class and follow the classic Delphi syntax. They're reference types, see also [Records](Records.md).

Named constructors are supported, as well as class methods, meta-classes, virtual methods, properties and destructors. Properties can optionally be array properties, and can feature an explicit index.

Visibilities are private, protected, public and published:
  * script mode (or main program), private & protected are understood as strict private and strict protected
  * in build mode (in units), private & protected are understood in the classic fashion (implementations in the unit have access to private/protected members)

Classes can implement [Interfaces](Interfaces.md) and they can be partial.

You can also declare class methods with "method" as in the Oxygene language, in addition to "procedure" and "function".

Additionally classes can be marked as "external", in which case they're meant to expose classes that are not implemented in the script, and unlike interfaces, then can defined fields.

## Properties ##

Properties allow to encapsulate with a field-like syntax what can actually be methods (getter/setter).

`property Name[args : Type] : Type read Getter write Setter; default;`

  * a property can optionally have arguments/indexes, such properties can optionally be marked as default
  * the Getter can be a method returning, a field, another property, or an expression (enclosed between brackets)
  * the Setter can be a method, a field, another property or an expression (enclosed between brackets, with Value being the pseudo-variable that receives the value assigned to the property)

The following form
`property Name : Type;`
declares a property backed by a hidden (inaccessible) field. The field can optionally be initialized.

The following form
`property Name;`
can be used to promote the visibility of a property without altering it in any other way, for instance to make public a property that was previously protected.

Properties can also be prefixed by 'class' in which case they will be restricted to class variables, class methods and class properties, but can then be used on the class type (metaclass) and not just on instance.