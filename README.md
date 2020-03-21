# mvp_core

An MVP (model/view/presenter) framework for applications 
written in dart. This package gives specific support to
the flutter framework.

## Purpose

### Weak coupling

This package attempts to create a weak coupling between
views and presenters in flutter applications. This means 
that views only know about the interfaces of their
associated presenters and presenters only know about the 
interfaces of their associated views.

### Automated testing

Because of this weak coupling, automatically testing an 
application becomes trivial. See [Testing](#Testing).

### Dynamic modeling

This package makes no assumptions about the model of your
application. This means that any model (or data) you choose
will work with this framework.

## Getting Started

## Testing 

> "The MVP pattern is a variation of the MVC pattern that 
> results in more testable code." - Ken Rodham
