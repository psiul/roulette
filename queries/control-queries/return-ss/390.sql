select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 641 and ss.ss_hash <= 974 and c.c_hash >= 65 and c.c_hash <= 815 and i.i_hash >= 273 and i.i_hash <= 673
;
