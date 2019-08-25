Sea RTL subset for Delphi 64bit

Copyright 17 June 2019 Roberto Della Pasqua

This folder contains:

- SeaMM.dll lock-free scalable allocator
- SeaRTL.dll simd enabled rtl subset routines
- SeaZIP.dll accelerated zlib deflate compression
- RDPMM64.pas wrapper for memory manager (put this unit as first unit clause in project source)
- RDPSimd64.pas wrapper for simd rtl
- RDPZlib64.pas wrapper for zlib deflate
- RDPWebBroker64.pas utils to enhance webbroker web apps
- IsapiTest.zip webbroker scalable app example
- SeaIISFilter.zip ultra-fast realtime zlib compression for IIS web server (5x faster than default gzip)
- License.txt for legal terms

The final user deployment is donateware. Please contact me roberto.dellapasqua@live.com or www.dellapasqua.com

A test with Indy, the most diffused TCP foundation for Delphi, on I7 cpu, shows an enhancement from 6934.29 ops/sec to 23097.68 ops/sec

Another test with WebBroker http compression, on I7 cpu, shows an enhancement from 147 pages/sec to 722 pages/sec

Best regards
Roberto Della Pasqua

