select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,item i
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 485 and ws.ws_hash <= 885 and hd.hd_hash >= 9 and hd.hd_hash <= 342 and cd.cd_hash >= 160 and cd.cd_hash <= 910
;
