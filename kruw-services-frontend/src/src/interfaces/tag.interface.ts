export interface TagState {
  tags: ITag[];
  devices: IDevice[];
  tagActive: ITag | null;
  deviceActive: IDevice | null;
  total: number;
  total_pages: number;
  refresh: boolean;
}

export interface ITag {
  id: number;
  number: string;
  code: string;
  date: string;
  status: string;
}

export interface IDevice {
  id: number;
  number: string;
  code: string;
}
