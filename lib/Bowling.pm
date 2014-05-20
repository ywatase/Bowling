package Bowling;
use Moo;
has $_ => (is => 'rw') for qw(file limit data);

sub run {
    my ($self) = @_;
    $self->data( do $self->file );
    $self->limit // $self->limit(10);
    $self->calc( $self->limit, [ 0, 0 ] );
}

my %pin_of = (
    'X' => sub {10},
    '/' => sub { 10 - $_[0] },
    '-' => sub {0},
);

sub calc {
    my ( $self, $frame, $next_pins ) = @_;
    return 0 if $frame-- == 0;
    my ($prev, $frame_score, @pins) = (0, 0, ());
    foreach my $result ( @{$self->data->[$frame]} ) {
        push @pins, $prev = ( $pin_of{$result} // sub {$result} )->($prev);
        $frame_score += $prev;
        $frame_score += $next_pins->[0] if $result eq '/';
        $frame_score += $next_pins->[0] + $next_pins->[1] if  $result eq 'X';
    }
    return $frame_score + $self->calc( $frame, [ (@pins, @$next_pins)[0..1] ] );
}
1;
