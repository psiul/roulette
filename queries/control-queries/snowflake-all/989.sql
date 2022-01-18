select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 373 and ws.ws_hash <= 706 and d.d_hash >= 312 and d.d_hash <= 712 and cd.cd_hash >= 210 and cd.cd_hash <= 960
;
