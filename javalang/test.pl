#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



use JavaLang;

public class GreeterClass {
    public static void greet(String name) {
        System.out.println("Hi! " + name);
    }
    public static void another(String name) {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + i);
        }
    }
}

no JavaLang;

say "done";
java::GreeterClass::greet('yes');
java::GreeterClass::another('nope');
