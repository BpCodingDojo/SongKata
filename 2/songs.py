
class Album(object):

    def __init__(self):
        self._songs = []

    def find_bests(self, best_n):
        song_qualities = self._calc_qualities()
        sorted_songs = sorted(song_qualities, key=lambda e: e[0], reverse=True)
        best_n_songs = sorted_songs[:best_n]
        best_song_names = map(lambda x: x[1], best_n_songs)
        return best_song_names

    def _calc_qualities(self):
        calculated_qualities = []

        for i in range(len(self._songs)):
            quality = (i + 1) * self._songs[i].listened_to
            title = self._songs[i].title
            calculated_qualities.append((quality, title))

        return calculated_qualities

    def load(self, songs):
        self._songs = songs

    def load_from_file(self, file):
        pass


class Song(object):

    def __init__(self, song_data):
        self.listened_to = song_data[0]
        self.title = song_data[1]


