package SVG::Barcode::UPCA;
use parent 'SVG::Barcode';
use strict;
use warnings;
use utf8;
use v5.24;
use feature 'signatures';
no warnings 'experimental::signatures';

use Exporter 'import';
our @EXPORT_OK = qw|plot_upca|;

use GD::Barcode::UPCA;

our $VERSION = '0.01';

use constant DEFAULTS => {
  lineheight => 30,
  linewidth  => 1,
  textsize   => 10,
};

SVG::Barcode::_param(__PACKAGE__, $_, DEFAULTS->{$_}) for keys DEFAULTS->%*;

# functions

sub plot_upca ($text, %params) {
  return __PACKAGE__->new(%params)->plot($text);
}

# internal methods

sub _plot_1d ($self, $code, $sign, $signlong) {
  my @line;
  my $width    = $self->{linewidth};
  my $height   = $self->{lineheight};
  my $add_line = sub {
    if (@line) {
      $self->_rect(@line);
      @line = ();
    }
  };
  for my $x (0 .. $#$code) {
    if ($code->[$x] eq $sign) {
      if (@line) {
        $line[2] += $width;
      } else {
        @line = ($x * $width, 0, $width, $height);
      }
    } elsif ($code->[$x] eq $signlong) {
      # Make a slightly taller line
      if (@line) {
        $line[2] += $width;
      } else {
        @line = ($x * $width, 0, $width, $height * 1.05);
      }
    } else {
      $add_line->();
    }
  }
  $add_line->();
}

sub _plot ($self, $text) {
  $self->{plotter} ||= GD::Barcode::UPCA->new($text);

  my @code = split //, $self->{plotter}->barcode();
  $self->_plot_1d(\@code, '1', 'G');
  $self->_plot_text($text);
}

1;

=encoding utf8

=head1 NAME

SVG::Barcode::UPCA - Generator for SVG based UPCA barcodes

=head1 SYNOPSIS

    use SVG::Barcode::UPCA;

    my $upca = SVG::Barcode::UPCA->new;
    my $svg     = $upca->plot('https://perldoc.pl');

    $upca->linewidth;     # 1
    $upca->lineheight;    # 30
    $upca->textsize;      # 10
                             # from SVG::Barcode:
    $upca->foreground;    # black
    $upca->background;    # white
    $upca->margin;        # 2
    $upca->id;
    $upca->class;
    $upca->width;
    $upca->height;
    $upca->scale;

    my %params = (
      lineheight => 40,
      textsize   => 0,
    );
    $upca = SVG::Barcode::UPCA->new(%params);

    # use as function
    use SVG::Barcode::UPCA 'plot_upca';

    my $svg = plot_upca('https://perldoc.pl', %params);

=head1 DESCRIPTION

L<SVG::Barcode::UPCA> is a generator for SVG based UPCA barcodes.

=head1 FUNCTIONS

=head2 plot_upca

    use SVG::Barcode::UPCA 'plot_upca';

    $svg = plot_upca($text, %params);

Returns a UPCA barcode using the provided text and parameters.

=head1 CONSTRUCTOR

=head2 new

    $upca = SVG::Barcode::UPCA->new;             # create with defaults
    $upca = SVG::Barcode::UPCA->new(\%params);

Creates a new UPCA plotter. Inherited from L<SVG::Barcode|SVG::Barcode/new>.

=head1 METHODS

=head2 plot

Creates a SVG code. Inherited from L<SVG::Barcode|SVG::Barcode/plot>.

=head1 PARAMETERS

Inherited from L<SVG::Barcode>:
L<background|SVG::Barcode/background>,
L<class|SVG::Barcode/class>,
L<foreground|SVG::Barcode/foreground>,
L<height|SVG::Barcode/height>,
L<id|SVG::Barcode/id>,
L<margin|SVG::Barcode/margin>,
L<scale|SVG::Barcode/scale>,
L<width|SVG::Barcode/width>.

=head2 lineheight

    $value   = $upca->lineheight;
    $upca = $upca->lineheight($newvalue);
    $upca = $upca->lineheight('');          # 30

Getter and setter for the height of a line. Default C<30>.

=head2 linewidth

    $value   = $upca->linewidth;
    $upca = $upca->linewidth($newvalue);
    $upca = $upca->linewidth('');          # 1

Getter and setter for the width of a single line. Default C<1>.

=head2 textsize

    $value   = $upca->textsize;
    $upca = $upca->textsize($newvalue);
    $upca = $upca->textsize('');          # 10

Getter and setter for the size of the text a the bottom. C<0> hides the text. Default C<10>.

=head1 AUTHOR & COPYRIGHT

Derived from SVG::Barcode::Code128 © 2019–2020 by Tekki (Rolf Stöckli).
© 2025 by bwarden (Brett T. Warden).

This program is free software, you can redistribute it and/or modify it under the terms of the
Artistic License version 2.0.

=head1 SEE ALSO

L<SVG::Barcode>, L<GD::Barcode::UPCA>.

=cut
