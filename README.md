# NAME

SVG::Barcode::Code128 - Generator for SVG based Code 128 barcodes

# SYNOPSIS

    use SVG::Barcode::Code128;

    my %params = (
      background => 'white',
      foreground => 'black',
      lineheight => 30,
      linewidth  => 2,
      margin     => 10,
      textsize   => 10,
    );
    my $code128 = SVG::Barcode::Code128->new(\%params);
    my $svg     = $code128->plot('https://perldoc.pl');
    my $svg2    = $code128->param(foreground => 'red')->plot('https://perldoc.pl');

    # use as function
    use SVG::Barcode::Code128 'plot_code128';

    my $svg = plot_code128('https://perldoc.pl', \%params);

# DESCRIPTION

[SVG::Barcode::Code128](https://metacpan.org/pod/SVG::Barcode::Code128) is a generator for SVG based Code 128 barcodes.

# FUNCTIONS

## plot\_code128

    use SVG::Barcode::Code128 'plot_code128';

    my $svg = plot_code128($text, \%params);

Returns a Code 128 barcode using the provided text and parameters.

# CONSTRUCTOR

## new

    $code128 = SVG::Barcode::Code128->new(\%params);
    $code128 = SVG::Barcode::Code128->new;             # create with defaults

Creates a new Code 128 plotter. Inherited from ["new" in SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#new).

Accepted parameters are:

- background

    Color of the background. Default `'white'`.

- foreground

    Color of the dots. Default `'black'`.

- lineheight

    Height of the lines. Default `30`.

- linewidth

    Width of a single line. Default `2`.

- margin

    Margin around the code. Default `10`.

- textsize

    Size of the text at the bottom of the code. `0` means no text. Default `10`.

# METHODS

## param

Getter and setter for the parameters. Inherited from ["param" in SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#param).

## plot

Creates a SVG code. Inherited from ["plot" in SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#plot).

# SEE ALSO

[SVG::Barcode](https://metacpan.org/pod/SVG::Barcode), [Barcode::Code128](https://metacpan.org/pod/Barcode::Code128).

# AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.
