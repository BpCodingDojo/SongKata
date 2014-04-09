import unittest
from songs import Album, Song


class Test(unittest.TestCase):

    def setUp(self):
        self.album = Album()

    def test_sample_1(self):
        test_songs = [(30, "one"), (30, "two"), (15, "three"), (25, "four")]
        self.album.load([Song(song) for song in test_songs])
        self.assertEqual(self.album.find_bests(2), ["four", "two"])

    def test_load_songs_from_file(self):
        self.album.load_from_file("sample.txt")
        #self.assertEqual(self.album.find_bests(2), ["four", "two"])
