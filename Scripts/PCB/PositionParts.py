import pcbnew

# Called in PCBNEW console using: exec(open("D:/Repos/OpenAlarm/Scripts/PCB/PositionParts.py").read())


class PositionPartPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "Postion part"
        self.category = "Mekatrol"
        self.description = "Positions a part"
        self.show_toolbar_button = False  # Optional, defaults to False
        self.board = pcbnew.GetBoard()

        # Set PCB size
        self.pcb_width = 220
        self.pcb_height = 140

        # Get the refernce connector (positions are relative to it)
        self.ref_con = self.board.FindModuleByReference("J14")

    def GetPad(self, module, name):
        for pad in module.Pads():
            if pad.GetName() == name:
                return pad
        return None

    def AlignPads(self, align_to, align, align_to_pad_name, align_pad_name, dx, dy):

        align_to_pad = self.GetPad(align_to, align_to_pad_name)
        align_pad = self.GetPad(align, align_pad_name)

        align_to_pos = align_to_pad.GetBoundingBox().GetCenter()
        align_pos = align_pad.GetBoundingBox().GetCenter()
        pos_delta = pcbnew.wxPoint(
            (align_to_pos.x - align_pos.x) + dx, (align_to_pos.y - align_pos.y) + dy)
        align.Move(pos_delta)

    def AlignAndOrient(self, con_ref, res_ref, align_to_pad_ref, align_pad_ref, angle, dx, dy):
        # Orient first so that align uses the orientated position
        res = self.board.FindModuleByReference(res_ref)
        con = self.board.FindModuleByReference(con_ref)
        res.SetOrientation(angle * 10)

        # Align pads
        self.AlignPads(con, res, align_to_pad_ref,
                       align_pad_ref, dx, dy)

    def AlignInputs(self):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J17")
        con.SetOrientation(1800)
        con_width = con.GetBoundingBox().GetWidth()

        # Set position of first connector
        con.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(
            60), pcbnew.FromMM(self.pcb_height) - 30))

        dx = con_width + pcbnew.FromMM(1)
        dy = 0
        self.AlignAndOrient("J17", "J18", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J18", "J19", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J19", "J20", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J20", "J21", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J21", "J22", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J22", "J23", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J23", "J24", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J24", "J4", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J4", "J5", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J5", "J8", "2", "2", 180, dx, dy)
        self.AlignAndOrient("J8", "J9", "2", "2", 180, dx, dy)

        dx = 0
        dy = pcbnew.FromMM(-8)

        self.AlignAndOrient("J4", "R17", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R17", "C8", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R17", "R7", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J5", "R18", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R18", "C9", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R18", "R9", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J8", "R33", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R33", "C12", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R33", "R25", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J9", "R34", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R34", "C13", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R34", "R27", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J17", "R71", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R71", "C44", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R71", "R55", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J18", "R72", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R72", "C45", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R72", "R57", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J19", "R73", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R73", "C46", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R73", "R59", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J20", "R74", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R74", "C47", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R74", "R61", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J21", "R95", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R95", "C48", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R95", "R79", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J22", "R96", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R96", "C49", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R96", "R81", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J23", "R97", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R97", "C50", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R97", "R83", "2", "2", -90, pcbnew.FromMM(-3), 0)

        self.AlignAndOrient("J24", "R98", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R98", "C51", "1", "1", 0, 0, pcbnew.FromMM(-3))
        self.AlignAndOrient("R98", "R85", "2", "2", -90, pcbnew.FromMM(-3), 0)

    def AlignOutputs(self, rs485con):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J2")
        con.SetOrientation(900)
        con_height = con.GetBoundingBox().GetHeight()

        rs485con_pos = rs485con.GetPosition()
        rs485con_bb = rs485con.GetBoundingBox()
        rs485con_height = rs485con_bb.GetHeight()
        rs485con_bottom = rs485con_pos.y + rs485con_height / 2

        # Set position of first connector
        con.SetPosition(pcbnew.wxPoint(
            rs485con_pos.x, rs485con_bottom + pcbnew.FromMM(2)))

        dx = 0
        dy = con_height + pcbnew.FromMM(1)
        self.AlignAndOrient("J2", "J3", "2", "2", 90, dx, dy)
        self.AlignAndOrient("J3", "J6", "2", "2", 90, dx, dy)
        self.AlignAndOrient("J6", "J7", "2", "2", 90, dx, dy)

        self.AlignAndOrient("J2", "Q1", "2", "1", -90, -pcbnew.FromMM(15), 0)
        self.AlignAndOrient("J3", "Q2", "2", "1", -90, -pcbnew.FromMM(15), 0)
        self.AlignAndOrient("J6", "Q3", "2", "1", -90, -pcbnew.FromMM(15), 0)
        self.AlignAndOrient("J7", "Q4", "2", "1", -90, -pcbnew.FromMM(15), 0)

    def AlignRS485Connector(self):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J13")
        con.SetOrientation(900)

        con_height = con.GetBoundingBox().GetHeight()

        # Set position of first connector
        con.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(self.pcb_width),
                        con_height - pcbnew.FromMM(0.5)))

        return con

    def AlignPowerConnectors(self):
        con = self.ref_con
        con.SetOrientation(-900)

        # Get the width of a connector
        con_height = con.GetBoundingBox().GetHeight()

        # Set position of first connector
        con.SetPosition(pcbnew.wxPoint(0, -con_height / 2 + pcbnew.FromMM(3)))

        dx = 0
        dy = con_height + pcbnew.FromMM(1)
        self.AlignAndOrient("J14", "J16", "2", "2", -90,
                            dx, dy + pcbnew.FromMM(10))
        self.AlignAndOrient("J16", "J15", "2", "2", -90,
                            dx, dy + pcbnew.FromMM(10))

        self.ref_con_top = self.ref_con.GetPosition().y

    def PositionHoles(self):
        x1 = 20
        y1 = 7
        x2 = self.pcb_width - 20
        x3 = 3
        x4 = self.pcb_width - 5
        y2 = self.pcb_height - 5

        h = self.board.FindModuleByReference("H1")
        h.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(x1), pcbnew.FromMM(y1)))
        h = self.board.FindModuleByReference("H2")
        h.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(x2), pcbnew.FromMM(y1)))
        h = self.board.FindModuleByReference("H3")
        h.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(x3), pcbnew.FromMM(y2)))
        h = self.board.FindModuleByReference("H4")
        h.SetPosition(pcbnew.wxPoint(pcbnew.FromMM(x4), pcbnew.FromMM(y2)))

    def PositionEdge(self, edge, x1, y1, x2, y2):
        edge.SetStart(pcbnew.wxPoint(pcbnew.FromMM(x1), pcbnew.FromMM(y1)))
        edge.SetEnd(pcbnew.wxPoint(pcbnew.FromMM(x2), pcbnew.FromMM(y2)))

    def PostionBoardEdgeSegments(self):
        edge_margin = 10
        segments = list(self.board.GetDrawings())
        self.PositionEdge(segments[0], -edge_margin, -edge_margin,
                          self.pcb_width+edge_margin, -edge_margin)
        self.PositionEdge(segments[1], -edge_margin, self.pcb_height+edge_margin,
                          self.pcb_width+edge_margin, self.pcb_height+edge_margin)
        self.PositionEdge(
            segments[2], -edge_margin, -edge_margin, -edge_margin, self.pcb_height+edge_margin)
        self.PositionEdge(segments[3], self.pcb_width+edge_margin, -edge_margin,
                          self.pcb_width+edge_margin, self.pcb_height+edge_margin)

    def Run(self):
        self.AlignPowerConnectors()
        self.AlignInputs()
        rs485con = self.AlignRS485Connector()
        self.AlignOutputs(rs485con)
        self.PositionHoles()
        self.PostionBoardEdgeSegments()

        self.board.FindModuleByReference("C28").SetPosition(
            pcbnew.wxPoint(pcbnew.FromMM(40), pcbnew.FromMM(25)))
        self.board.FindModuleByReference("C25").SetPosition(
            pcbnew.wxPoint(pcbnew.FromMM(62), pcbnew.FromMM(25)))

        pcbnew.Refresh()


# PositionPartPlugin().register()
PositionPartPlugin().Run()
