select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,item i,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 518 and ws.ws_hash <= 851 and sm.sm_hash >= 25 and sm.sm_hash <= 425 and i.i_hash >= 9 and i.i_hash <= 759
;
