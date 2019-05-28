# NAME

SVG::Barcode::Code128 - Generator for SVG based Code 128 barcodes

# SYNOPSIS

    use SVG::Barcode::Code128;

    my $code128 = SVG::Barcode::Code128->new;
    my $svg     = $code128->plot('https://perldoc.pl');

    $code128->linewidth;     # 1
    $code128->lineheight;    # 30
    $code128->textsize;      # 10
                             # from SVG::Barcode:
    $code128->foreground;    # black
    $code128->background;    # white
    $code128->margin;        # 2
    $code128->id;
    $code128->class;
    $code128->width;
    $code128->height;
    $code128->scale;

    my %params = (
      lineheight => 40,
      textsize   => 0,
    );
    $code128 = SVG::Barcode::Code128->new(%params);

    # use as function
    use SVG::Barcode::Code128 'plot_code128';

    my $svg = plot_code128('https://perldoc.pl', %params);

# DESCRIPTION

[SVG::Barcode::Code128](https://metacpan.org/pod/SVG::Barcode::Code128) is a generator for SVG based Code 128 barcodes.

# FUNCTIONS

## plot\_code128

    use SVG::Barcode::Code128 'plot_code128';

    $svg = plot_code128($text, %params);

Returns a Code 128 barcode using the provided text and parameters.

# CONSTRUCTOR

## new

    $code128 = SVG::Barcode::Code128->new;             # create with defaults
    $code128 = SVG::Barcode::Code128->new(\%params);

Creates a new Code 128 plotter. Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#new).

# METHODS

## plot

Creates a SVG code. Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#plot).

# PARAMETERS

Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode):
[background](https://metacpan.org/pod/SVG::Barcode#background),
[class](https://metacpan.org/pod/SVG::Barcode#class),
[foreground](https://metacpan.org/pod/SVG::Barcode#foreground),
[height](https://metacpan.org/pod/SVG::Barcode#height),
[id](https://metacpan.org/pod/SVG::Barcode#id),
[margin](https://metacpan.org/pod/SVG::Barcode#margin),
[scale](https://metacpan.org/pod/SVG::Barcode#scale),
[width](https://metacpan.org/pod/SVG::Barcode#width).

## lineheight

    $value   = $code128->lineheight;
    $code128 = $code128->lineheight($newvalue);
    $code128 = $code128->lineheight('');          # 30

Getter and setter for the height of a line. Default `30`.

## linewidth

    $value   = $code128->linewidth;
    $code128 = $code128->linewidth($newvalue);
    $code128 = $code128->linewidth('');          # 1

Getter and setter for the width of a single line. Default `1`.

## textsize

    $value   = $code128->textsize;
    $code128 = $code128->textsize($newvalue);
    $code128 = $code128->textsize('');          # 10

Getter and setter for the size of the text a the bottom. `0` hides the text. Default `10`.

# SEE ALSO

[SVG::Barcode](https://metacpan.org/pod/SVG::Barcode), [Barcode::Code128](https://metacpan.org/pod/Barcode::Code128).

# AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.
