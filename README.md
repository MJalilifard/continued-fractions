# Continued Fractions
A **continued fraction** is a mathematical expression written as a fraction whose denominator contains a sum involving another fraction, which may itself be a simple or a continued fraction.

If all the numerators of the continued fraction are equal to one it's called **simple continued fraction** and It can be represented by a sequence of its denominators which is called coefficients:
$$
\frac{a}{b}
= a_0 + \cfrac{1}{a_1 + \cfrac{1}{a_2 + \cfrac{1}{a_3 + \cdots}}} = [a_0;a_1,a_2,...]
$$

In this project, I tried to find the coefficients of any given fraction. The results can be verified using the  JPG file.

## CFPeriodOfSquareRoot.jl
This file finds and prints the coefficients of square roots of numbers less than 100 on each line.

## ContinuedFraction
This is the main file that consists of:
- finding as many coefficients as you want (they can be infinite sometimes) 
- drawing continued fraction LaTeX format using Latexify
- checking if the coefficients have repeating pattern.

## AllPermutationsOfAnArray.jl
I don't remember why this file exists at the moment I'm writing this README :-) but it might have been useful at some point.

## RepeatingDecimals.jl
It attempts to find the repeating digits in the decimal expansion of a rational number.

I guess this was an exercise for me to check repeating patterns and it isn't directly related to continued fractions.