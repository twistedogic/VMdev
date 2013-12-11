#!/usr/bin/python

"""
Script created by VND - Visual Network Description
"""
from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSKernelSwitch, OVSLegacyKernelSwitch, UserSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel
from mininet.link import Link, TCLink

def topology():
    "Create a network."
    net = Mininet( controller=RemoteController, link=TCLink, switch=OVSKernelSwitch )

    print "*** Creating nodes"
    c1 = net.addController( 'c1', controller=RemoteController, ip='127.0.0.1', port=6633 )
    s2 = net.addSwitch( 's2' )
    s3 = net.addSwitch( 's3' )
    s4 = net.addSwitch( 's4' )
    s5 = net.addSwitch( 's5' )
    h7 = net.addHost( 'h7', mac='00:00:00:00:00:07', ip='10.0.0.7/8' )
    h8 = net.addHost( 'h8', mac='00:00:00:00:00:08', ip='10.0.0.8/8' )
    h9 = net.addHost( 'h9', mac='00:00:00:00:00:09', ip='10.0.0.9/8' )
    h10 = net.addHost( 'h10', mac='00:00:00:00:00:10', ip='10.0.0.10/8' )

    print "*** Creating links"
    net.addLink(h10, s5, 0, 5)
    net.addLink(h9, s5, 0, 4)
    net.addLink(h8, s3, 0, 5)
    net.addLink(h7, s3, 0, 4)
    net.addLink(s4, s5, 3, 3)
    net.addLink(s2, s4, 3, 2)
    net.addLink(s3, s4, 3, 1)
    net.addLink(s3, s5, 2, 2)
    net.addLink(s2, s3, 2, 1)
    net.addLink(s2, s5, 1, 1)

    print "*** Starting network"
    net.build()
    s5.start( [c1] )
    s4.start( [c1] )
    s3.start( [c1] )
    s2.start( [c1] )
    c1.start()

    print "*** Running CLI"
    CLI( net )

    print "*** Stopping network"
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    topology()

