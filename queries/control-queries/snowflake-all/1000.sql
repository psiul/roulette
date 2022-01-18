select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,household_demographics hd,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 47 and ws.ws_hash <= 380 and hd.hd_hash >= 202 and hd.hd_hash <= 602 and cd.cd_hash >= 190 and cd.cd_hash <= 940
;
