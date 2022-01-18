select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,item i,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 152 and ws.ws_hash <= 902 and cd.cd_hash >= 265 and cd.cd_hash <= 665 and i.i_hash >= 661 and i.i_hash <= 994
;
