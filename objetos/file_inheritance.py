class File:
    def __init__(self, path: str): 
        self.path = path
        self.contents= []

    def add_content(self, content: str):
        if content not in self.contents:
            self.contents.append(content)

    @property
    def size(self):
        sizes = (len(c) for c in self.contents)
        return sum(sizes)

    @property
    def info(self):
        return f'{self.path} [size={self.size}B]'


class MediaFile(File):
    def __init__(self, path: str, codec: str, geoloc: tuple[float], duration: int): 
        super().__init__(self.path)
        self.codec = codec
        self.geoloc = geoloc
        self.duration = duration

    @property
    def info(self):
        base_info = super(File, self).info()
        return f'''{base_info} 
        Codec: {self.codec}
        Geolocalization: {self.geoloc}
        Duration: {self.duration}'''


class VideoFile(MediaFile):
    def __init__(
        self, path: str, codec: str, geoloc: tuple[float], duration: int, dimensions: tuple[int]
    ): 
        super().__init__(self.path, codec, geoloc, duration)
        self.dimensions = dimensions

    @property
    def info(self): 
        base_info = super(MediaFile, self).info()
        return f'''{base_info}
        Dimensions: {self.dimensions}'''
