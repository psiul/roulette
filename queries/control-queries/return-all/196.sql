select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,item i,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 14 and cd.cd_hash <= 764 and i.i_hash >= 446 and i.i_hash <= 779 and hd.hd_hash >= 440 and hd.hd_hash <= 840
;
