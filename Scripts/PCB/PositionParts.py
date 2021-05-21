from pcbnew import *

# Called in PCBNEW console using: exec(open("D:/Repos/OpenAlarm/Scripts/PCB/PositionParts.py").read())


class PositionPartPlugin(ActionPlugin):
    def defaults(self):
        self.name = "Postion part"
        self.category = "Mekatrol"
        self.description = "Positions a part"
        self.show_toolbar_button = False  # Optional, defaults to False
        self.board = GetBoard()

        # Set PCB size
        self.pcb_width = 220
        self.pcb_height = 100

        # Get the refernce connector (positions are relative to it)
        self.ref_con = self.board.FindModuleByReference("J14")

    def GetPad(self, module, name):
        for pad in module.Pads():
            if pad.GetName() == name:
                return pad
        return None

    def PositionModuleByRef(self, module_ref, position, is_center):
        module = self.board.FindModuleByReference(module_ref)
        self.PositionModule(module, position, is_center)

    def PositionModule(self, module, position, is_center):
        bb = module.GetBoundingBox()
        width = bb.GetWidth()
        height = bb.GetHeight()
        if(is_center):
            module.SetPosition(position)
        else:
            module.SetPosition(position + wxPoint(width / 2.0, height / 2.0))

    def AlignPads(self, align_to, align, align_to_pad_name, align_pad_name, dx, dy):

        align_to_pad = self.GetPad(align_to, align_to_pad_name)
        align_pad = self.GetPad(align, align_pad_name)

        align_to_pos = align_to_pad.GetBoundingBox().GetCenter()
        align_pos = align_pad.GetBoundingBox().GetCenter()
        pos_delta = wxPoint((align_to_pos.x - align_pos.x) + dx, (align_to_pos.y - align_pos.y) + dy)
        align.Move(pos_delta)

    def AlignAndOrient(self, con_ref, res_ref, align_to_pad_ref, align_pad_ref, angle, dx, dy):
        # Orient first so that align uses the orientated position
        res = self.board.FindModuleByReference(res_ref)
        con = self.board.FindModuleByReference(con_ref)
        res.SetOrientation(angle * 10)

        # Align pads
        self.AlignPads(con, res, align_to_pad_ref, align_pad_ref, dx, dy)

    def LayoutLM339(self, ic_ref, position, capacitor_refs, resistor_refs):
        ic = self.board.FindModuleByReference(ic_ref)
        self.PositionModule(ic, position, True)

        self.AlignAndOrient(ic_ref, resistor_refs[0], "1", "2", -90, -FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[1], "14", "2", -90, FromMM(3.5), 0)

        self.AlignAndOrient(ic_ref, capacitor_refs[0], "7", "1", 0, 0, FromMM(3.5))

    def LayoutLM339s(self):
        x = 88
        y = 60
        dx = 20

        self.LayoutLM339("U2", wxPoint(FromMM(x), FromMM(y)), ["C14"], ["R11", "R29"])
        x += dx

        # U2

        self.AlignAndOrient("U2", "R8", "4", "1", -90, -FromMM(3.5), 0)
        self.AlignAndOrient("U2", "R15", "3", "2", -90, -FromMM(3.5), 0)
        self.AlignAndOrient("U2", "R21", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U2", "R26", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U2", "R31", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U2", "R36", "8", "1", -90, FromMM(3.5), 0)

        # U3
        self.LayoutLM339("U3", wxPoint(FromMM(x), FromMM(y)), ["C15"], ["R12", "R30"])
        x += dx

        self.AlignAndOrient("U3", "R10", "4", "2", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U3", "R16", "3", "1", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U3", "R22", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U3", "R28", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U3", "R32", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U3", "R37", "8", "1", -90, FromMM(3.5), 0)

        # U13
        self.LayoutLM339("U13", wxPoint(FromMM(x), FromMM(y)), ["C52"], ["R63", "R87"])
        x += dx

        self.AlignAndOrient("U13", "R56", "4", "2", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U13", "R67", "3", "1", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U13", "R75", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U13", "R80", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U13", "R91", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U13", "R99", "8", "1", -90, FromMM(3.5), 0)

        # U14
        self.LayoutLM339("U14", wxPoint(FromMM(x), FromMM(y)), ["C53"], ["R64", "R88"])
        x += dx

        self.AlignAndOrient("U14", "R58", "4", "2", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U14", "R68", "3", "1", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U14", "R76", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U14", "R82", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U14", "R92", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U14", "R100", "8", "1", -90, FromMM(3.5), 0)

        # U15
        self.LayoutLM339("U15", wxPoint(FromMM(x), FromMM(y)), ["C54"], ["R65", "R89"])
        x += dx

        self.AlignAndOrient("U15", "R60", "4", "2", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U15", "R69", "3", "1", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U15", "R77", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U15", "R84", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U15", "R93", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U15", "R101", "8", "1", -90, FromMM(3.5), 0)

        # U16
        self.LayoutLM339("U16", wxPoint(FromMM(x), FromMM(y)), ["C55"], ["R66", "R90"])

        self.AlignAndOrient("U16", "R62", "4", "2", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U16", "R70", "3", "1", 90, -FromMM(3.5), 0)
        self.AlignAndOrient("U16", "R78", "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient("U16", "R86", "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U16", "R94", "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient("U16", "R102", "8", "1", -90, FromMM(3.5), 0)

    def AlignInputs(self):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J17")
        con.SetOrientation(1800)
        con_width = con.GetBoundingBox().GetWidth()

        # Set position of first connector
        con.SetPosition(wxPoint(FromMM(
            60), FromMM(self.pcb_height) - 30))

        dx = con_width + FromMM(1)
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
        dy = FromMM(-8)

        self.AlignAndOrient("J4", "R17", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R17", "C8", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R17", "R7", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J5", "R18", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R18", "C9", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R18", "R9", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J8", "R33", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R33", "C12", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R33", "R25", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J9", "R34", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R34", "C13", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R34", "R27", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J17", "R71", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R71", "C44", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R71", "R55", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J18", "R72", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R72", "C45", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R72", "R57", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J19", "R73", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R73", "C46", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R73", "R59", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J20", "R74", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R74", "C47", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R74", "R61", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J21", "R95", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R95", "C48", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R95", "R79", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J22", "R96", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R96", "C49", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R96", "R81", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J23", "R97", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R97", "C50", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R97", "R83", "2", "2", -90, FromMM(-4), 0)

        self.AlignAndOrient("J24", "R98", "2", "2", -90, dx, dy)
        self.AlignAndOrient("R98", "C51", "1", "1", 0, 0, FromMM(-3))
        self.AlignAndOrient("R98", "R85", "2", "2", -90, FromMM(-4), 0)

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
        con.SetPosition(wxPoint(
            rs485con_pos.x, rs485con_bottom + FromMM(2)))

        dx = 0
        dy = con_height + FromMM(1)
        self.AlignAndOrient("J2", "J3", "2", "2", 90, dx, dy)
        self.AlignAndOrient("J3", "J6", "2", "2", 90, dx, dy)
        self.AlignAndOrient("J6", "J7", "2", "2", 90, dx, dy)

        self.AlignAndOrient("J2", "Q1", "2", "1", -90, -FromMM(15), 0)
        self.AlignAndOrient("J3", "Q2", "2", "1", -90, -FromMM(15), 0)
        self.AlignAndOrient("J6", "Q3", "2", "1", -90, -FromMM(15), 0)
        self.AlignAndOrient("J7", "Q4", "2", "1", -90, -FromMM(15), 0)

    def AlignRS485Connector(self):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J13")
        con.SetOrientation(900)

        con_height = con.GetBoundingBox().GetHeight()

        # Set position of first connector
        con.SetPosition(wxPoint(FromMM(self.pcb_width),
                        con_height - FromMM(0.5)))

        return con

    def AlignPowerConnectors(self):
        con = self.ref_con
        con.SetOrientation(-900)

        # Get the width of a connector
        con_height = con.GetBoundingBox().GetHeight()

        # Set position of first connector
        con.SetPosition(wxPoint(0, -con_height / 2 + FromMM(3)))

        dx = 0
        dy = con_height + FromMM(1)
        self.AlignAndOrient("J14", "J16", "2", "2", -90,
                            dx, dy + FromMM(10))
        self.AlignAndOrient("J16", "J15", "2", "2", -90,
                            dx, dy + FromMM(10))

        self.ref_con_top = self.ref_con.GetPosition().y

    def PositionHoles(self):
        x1 = 20
        y1 = 7
        x2 = self.pcb_width - 20
        x3 = 3
        x4 = self.pcb_width - 5
        y2 = self.pcb_height - 5

        h = self.board.FindModuleByReference("H1")
        h.SetPosition(wxPoint(FromMM(x1), FromMM(y1)))
        h = self.board.FindModuleByReference("H2")
        h.SetPosition(wxPoint(FromMM(x2), FromMM(y1)))
        h = self.board.FindModuleByReference("H3")
        h.SetPosition(wxPoint(FromMM(x3), FromMM(y2)))
        h = self.board.FindModuleByReference("H4")
        h.SetPosition(wxPoint(FromMM(x4), FromMM(y2)))

    def PositionEdge(self, edge, p1, p2):
        edge.SetStart(p1)
        edge.SetEnd(p2)

    def PostionBoardArea(self):
        # Define PCB margin around board size, noting that
        # top left is (0, 0) and bottom right is (width, height)
        edge_margin = 10

        # Define corner locations
        top_left = wxPointMM(-edge_margin, -edge_margin)
        top_right = wxPointMM(self.pcb_width + edge_margin, -edge_margin)
        bottom_left = wxPointMM(-edge_margin, self.pcb_height+edge_margin)
        bottom_right = wxPointMM(self.pcb_width+edge_margin, self.pcb_height+edge_margin)

        # Position cut edges
        segments = list(self.board.GetDrawings())
        self.PositionEdge(segments[0], top_left, top_right)
        self.PositionEdge(segments[1], bottom_left, bottom_right)
        self.PositionEdge(segments[2], top_left, bottom_left)
        self.PositionEdge(segments[3], bottom_left, top_right)

        # Position fill area
        area = self.board.GetArea(0)  # Assume area 0
        area.SetCornerPosition(0, top_left)
        area.SetCornerPosition(1, top_right)
        area.SetCornerPosition(2, bottom_right)
        area.SetCornerPosition(3, bottom_left)

    def PositionModules(self):
        self.PositionModuleByRef("U1", wxPointMM(160, 6), True)
        self.PositionModuleByRef("U2", wxPointMM(88, 60), True)
        self.PositionModuleByRef("U3", wxPointMM(108, 60), True)
        self.PositionModuleByRef("U4", wxPointMM(160, 23.5), True)
        self.PositionModuleByRef("U5", wxPointMM(148, -5.5), True)
        self.PositionModuleByRef("U6", wxPointMM(177.5, 23), True)
        self.PositionModuleByRef("U7", wxPointMM(167.5, 16), True)
        self.PositionModuleByRef("U8", wxPointMM(127, 1), True)
        self.PositionModuleByRef("U9", wxPointMM(207.5, 12.5), True)
        self.PositionModuleByRef("U10", wxPointMM(54.5, 6.5), True)
        self.PositionModuleByRef("U11", wxPointMM(95.5, 20.5), True)
        self.PositionModuleByRef("U12", wxPointMM(86, 6.5), True)
        self.PositionModuleByRef("U13", wxPointMM(128, 60), True)
        self.PositionModuleByRef("U14", wxPointMM(148, 60), True)
        self.PositionModuleByRef("U15", wxPointMM(168, 60), True)
        self.PositionModuleByRef("U16", wxPointMM(188, 60), True)

    def Run(self):
        self.AlignPowerConnectors()
        self.PositionModules()
        self.AlignInputs()
        self.LayoutLM339s()
        rs485con = self.AlignRS485Connector()
        self.AlignOutputs(rs485con)
        self.PositionHoles()
        self.PostionBoardArea()

        self.board.FindModuleByReference("C28").SetPosition(wxPoint(FromMM(40), FromMM(25)))
        self.board.FindModuleByReference("C25").SetPosition(wxPoint(FromMM(62), FromMM(25)))

        Refresh()


# PositionPartPlugin().register()
PositionPartPlugin().Run()
