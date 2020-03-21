# mvp_core

An MVP (model/view/presenter) framework for applications 
written in dart. This package gives specific support to
the flutter framework.

## Purpose

> "The MVP pattern is a variation of the MVC pattern that 
> results in more testable code." - Ken Rodham

This package attempts to create a weak coupling between
views and presenters in flutter applications. This means 
that views only know about the interfaces of their
associated presenters and presenters only know about the 
interfaces of their associated views.

Because of this weak coupling, automatically testing an 
application becomes trivial. See [Testing](#Testing).

## Getting Started

## Testing 
