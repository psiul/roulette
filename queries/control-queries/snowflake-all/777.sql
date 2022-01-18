select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,warehouse w,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 196 and i.i_hash <= 946 and hd.hd_hash >= 436 and hd.hd_hash <= 836 and cd.cd_hash >= 490 and cd.cd_hash <= 823
;
