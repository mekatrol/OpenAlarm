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
        self.pcb_height = 85

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

        self.AlignAndOrient(ic_ref, capacitor_refs[0], "7", "1", 0, FromMM(1.4), FromMM(3.5))

        self.AlignAndOrient(ic_ref, resistor_refs[0], "1", "2", -90, -FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[1], "14", "2", -90, FromMM(3.5), 0)

        self.AlignAndOrient(ic_ref, resistor_refs[2], "4", "1", -90, -FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[3], "3", "2", -90, -FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[4], "6", "1", -90, -FromMM(3.5), 0)

        self.AlignAndOrient(ic_ref, resistor_refs[5], "11", "2", -90, FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[6], "10", "1", -90, FromMM(3.5), 0)
        self.AlignAndOrient(ic_ref, resistor_refs[7], "8", "1", -90, FromMM(3.5), 0)

    def LayoutLM339s(self):
        x = 82
        y = 45
        dx = 20

        self.LayoutLM339("U2", wxPointMM(x, y), ["C14"], ["R11", "R29", "R8", "R15", "R21", "R26", "R31", "R36"])
        x += dx
        self.LayoutLM339("U3", wxPointMM(x, y), ["C15"], ["R12", "R30", "R10", "R16", "R22", "R28", "R32", "R37"])
        x += dx
        self.LayoutLM339("U13", wxPointMM(x, y), ["C52"], ["R63", "R87", "R56", "R67", "R75", "R80", "R91", "R99"])
        x += dx
        self.LayoutLM339("U14", wxPointMM(x, y), ["C53"], ["R64", "R88", "R58", "R68", "R76", "R82", "R92", "R100"])
        x += dx
        self.LayoutLM339("U15", wxPointMM(x, y), ["C54"], ["R65", "R89", "R60", "R69", "R77", "R84", "R93", "R101"])
        x += dx
        self.LayoutLM339("U16", wxPointMM(x, y), ["C55"], ["R66", "R90", "R62", "R70", "R78", "R86", "R94", "R102"])

    def AlignInputs(self):
        # Get the width of a connector
        con = self.board.FindModuleByReference("J4")
        con.SetOrientation(0)
        con_width = con.GetBoundingBox().GetWidth()

        # Set position of first connector
        con.SetPosition(wxPointMM(50, self.pcb_height))

        dx = con_width + FromMM(1)
        dy = 0
        self.AlignAndOrient("J4", "J8", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J8", "J5", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J5", "J9", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J9", "J17", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J17", "J21", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J21", "J18", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J18", "J22", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J22", "J19", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J19", "J23", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J23", "J20", "2", "2", 0, dx, dy)
        self.AlignAndOrient("J20", "J24", "2", "2", 0, dx, dy)

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
        rs485con_bottom = rs485con_pos.y + (rs485con_height) / 2

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

        pos = con.GetPosition()

        # Set position of first connector
        moveX = self.pcb_width - ToMM(pos.x)
        moveY = ToMM(-(pos.y - con_height / 2.0))
        con.Move(wxPointMM(moveX, moveY))

        con2 = self.board.FindModuleByReference("J25")
        con2.SetOrientation(900)
        self.AlignAndOrient("J13", "J25", "2", "2", 90, 0, con_height + FromMM(2))

        return con2

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
        x3 = 3
        x4 = self.pcb_width - 8.5
        y2 = self.pcb_height

        h = self.board.FindModuleByReference("H1")
        h_height = h.GetBoundingBox().GetHeight()

        h.SetPosition(wxPointMM(14, -3.5))
        h = self.board.FindModuleByReference("H2")
        h.SetPosition(wxPointMM(200, -3.5))
        h = self.board.FindModuleByReference("H3")
        h.SetPosition(wxPointMM(x3, y2))
        h = self.board.FindModuleByReference("H4")
        h.SetPosition(wxPointMM(x4, y2 + ToMM(h_height / 2.0)))

    def PositionEdge(self, edge, p1, p2):
        edge.SetStart(p1)
        edge.SetEnd(p2)

    def PostionBoardArea(self):
        # Define PCB margin around board size, noting that
        # top left is (0, 0) and bottom right is (width, height)
        edge_margin = 12

        # Define corner locations
        top_left = wxPointMM(-edge_margin, -edge_margin)
        top_right = wxPointMM(self.pcb_width + edge_margin, -edge_margin)
        bottom_left = wxPointMM(-edge_margin, self.pcb_height+edge_margin)
        bottom_right = wxPointMM(self.pcb_width+edge_margin, self.pcb_height+edge_margin)

        # Position cut edges
        segments = []
        for dwg in self.board.GetDrawings():
            if(dwg.GetClass() == "DRAWSEGMENT" and dwg.GetLayerName() == "Dwgs.User"):
                segments.append(dwg)
        self.PositionEdge(segments[0], top_left, top_right)
        self.PositionEdge(segments[1], top_right, bottom_right)
        self.PositionEdge(segments[2], bottom_right, bottom_left)
        self.PositionEdge(segments[3], bottom_left, top_left)

        # Position fill area
        self.PositionFillArea(0, top_left, top_right, bottom_right, bottom_left)
        self.PositionFillArea(1, top_left, top_right, bottom_right, bottom_left)
        self.PositionFillArea(2, top_left, top_right, bottom_right, bottom_left)

    def PositionFillArea(self, area_index, top_left, top_right, bottom_right, bottom_left):
        area = self.board.GetArea(area_index)
        if(area != None):
            area.SetCornerPosition(0, top_left)
            area.SetCornerPosition(1, top_right)
            area.SetCornerPosition(2, bottom_right)
            area.SetCornerPosition(3, bottom_left)

    def PositionModules(self):
        self.PositionModuleByRef("U1", wxPointMM(160, 6), True)
        self.PositionModuleByRef("U2", wxPointMM(88, 60), True)
        self.PositionModuleByRef("U3", wxPointMM(108, 60), True)
        self.PositionModuleByRef("U4", wxPointMM(160, 23.5), True)
        self.PositionModuleByRef("U5", wxPointMM(209, 26), True)
        self.PositionModuleByRef("U6", wxPointMM(177.5, 23), True)
        self.PositionModuleByRef("U7", wxPointMM(167.5, 16), True)
        self.PositionModuleByRef("U8", wxPointMM(127, 1), True)
        self.PositionModuleByRef("U9", wxPointMM(209, 4.0), True)
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

        self.board.FindModuleByReference("C28").SetPosition(wxPointMM(40, 25))
        self.board.FindModuleByReference("C25").SetPosition(wxPointMM(62, 25))

        Refresh()


# PositionPartPlugin().register()
PositionPartPlugin().Run()
