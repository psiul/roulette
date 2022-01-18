select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,item i,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 33 and ws.ws_hash <= 366 and c.c_hash >= 220 and c.c_hash <= 970 and cd.cd_hash >= 501 and cd.cd_hash <= 901
;
