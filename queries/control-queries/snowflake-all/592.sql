select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 467 and ws.ws_hash <= 867 and hd.hd_hash >= 597 and hd.hd_hash <= 930 and d.d_hash >= 180 and d.d_hash <= 930
;
