select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,household_demographics hd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 488 and ws.ws_hash <= 888 and c.c_hash >= 42 and c.c_hash <= 792 and cd.cd_hash >= 237 and cd.cd_hash <= 570
;
