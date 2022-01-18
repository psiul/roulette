select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,item i,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 86 and ws.ws_hash <= 836 and i.i_hash >= 306 and i.i_hash <= 706 and cd.cd_hash >= 423 and cd.cd_hash <= 756
;
