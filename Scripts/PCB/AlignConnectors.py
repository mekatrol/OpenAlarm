from pcbnew import *
import os


class ConnectorAlignPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "Connector layout"
        self.category = "Mekatrol"
        self.description = "Lays out connectors"
        self.show_toolbar_button = False  # Optional, defaults to False
        # self.icon_file_name = os.path.join(os.path.dirname(__file__), 'simple_plugin.png') # Optional, defaults to ""

    def Run(self):
        board = GetBoard()
        connector = board.FindModuleByReference("J21")
        resitor = board.FindModuleByReference("R95")
        conn_pos = connector.GetPosition()
        xmils = conn_pos.x
        ymils = conn_pos.y - FromMils(10)
        resitor.SetPosition(wxPoint(FromMils(xmils), FromMils(ymils)))
        resitor.SetOrientation(0)


ConnectorAlignPlugin().register()  # Instantiate and register to Pcbnew
