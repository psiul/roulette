select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,household_demographics hd,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 327 and ws.ws_hash <= 660 and cd.cd_hash >= 236 and cd.cd_hash <= 986 and hd.hd_hash >= 284 and hd.hd_hash <= 684
;
