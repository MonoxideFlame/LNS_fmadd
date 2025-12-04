# Slide Rule Addition Technique:

In a slide rule, addition is done on a log scale with an added addition error scale, meaning multiplication is natural, and addition is a pain. It involves computing transcendental functions, which can hinder any serious attempt at using this mechanism in a computer.

Due to the binary nature of hardware, in our chosen system, we will use Octaves as our base.

The difference between 7 and 10 is three doublings or octaves. 

The issue is that the dilineation of octaves is much too coarse. Ideally, we would want some tradeoff that still preserves the logarithmic sequence. A natural method to do this would involve using fixed point arithmetic.

multiplication and division comes easy. Very easy in fact. Addition and Subtraction now become nightmares in this domain.

if we represent a number's logarithm with lga, for log\_2(a), then here is an outline of the problem. 

# Addition in a log scale:

(2^lga + 2^lgb) = 2^lga(1 + 2^(lgb-lga))

if we take the log of both sides:

lg(2^lga + 2^lgb) = lga + lg(1 + 2^(lgb-lga)) 

Adding in the log domain becomes this 2 step process:
```
x = lgb - lga

lg(sum) = lga + lg(1 + 2^x)
```
Thus, the crux of this problem comes down to solving the unary function, lg(1+2^x) quickly and accurately enough, especially if we are to implement at multiply accumulator. 

This has been explored before, however, there was an issue solving the precision all the way out to 32 bits or 64 bits. However, considering today's machine learning landscape, a need for "quick and dirty" arithmetic arises, and here, the existing use of low bit depth representations and algorithms might make this feasible once again. Thus, it makes sense to write this paper. 

## Potential approaches to solving this weird function:

Ideas to produce this unary mapping might include Piecewise linear (the ranges would have to be chosen such that the weights have one or two hot binary representations), or a basic LUT driven approach. 

If this is solved for positive values of x, we can also solve it for negative values, since lg(1 + 2^x) = lg(1 + 2^(-x)) + x

An interesting aspect of this function is that as the x gets larger, it exponentially approaches x. As the number gets smaller, it exponentially approaches 0. This could be used to limit our required range of the function to only a handful of values. 

Also, since our addition routine uses only integer addition and subtraction outside this one function, any and all quantization and rounding errors must stem from the implementation of this one function.

To implement subtraction involves a similar unary function with slightly different properties:

lg(1-2^x). This has an asymptote at 0, where it extends to infinity. Here, PWL is out of the question. However, a lookup table for values close to zero, and 0 for values away from it might work. 

Another potential method would be to massage the number representation itself to agree better (statistically) with an approximation method we choose. It would make math in general less exact in this medium, but it would be leagues faster. 






