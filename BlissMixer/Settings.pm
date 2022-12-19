package Plugins::BlissMixer::Settings;

#
# LMS Bliss Mixer
#
# (c) 2022 Craig Drummond
#
# Licence: GPL v3
#

use strict;
use base qw(Slim::Web::Settings);

use Slim::Utils::Log;
use Slim::Utils::Misc;
use Slim::Utils::Strings qw(string);
use Slim::Utils::Prefs;

my $log = Slim::Utils::Log->addLogCategory({
	'category'     => 'plugin.blissmixer',
	'defaultLevel' => 'ERROR',
});

my $prefs = preferences('plugin.blissmixer');
my $serverprefs = preferences('server');

sub name {
	return Slim::Web::HTTP::CSRF->protectName('BlissMixer');
}

sub page {
	return Slim::Web::HTTP::CSRF->protectURI('plugins/BlissMixer/settings/blissmixer.html');
}

sub prefs {
	return ($prefs, qw(host mixer_port filter_genres filter_xmas min_duration max_duration no_repeat_artist no_repeat_album no_repeat_track dstm_tracks genre_groups weight_0 weight_1 weight_2 weight_3 weight_4 weight_5 weight_6 weight_7 weight_8 weight_9 weight_10 weight_11 weight_12 weight_13 weight_14 weight_15 weight_16 weight_17 weight_18 weight_19));
}

sub beforeRender {
    my ($class, $paramRef) = @_;
    $paramRef->{allowPortConfig} = $serverprefs->get('authorize');
}


sub handler {
	my ($class, $client, $params, $callback, @args) = @_;
	return $class->SUPER::handler($client, $params);
}

1;

__END__
