select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,store_returns sr,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 209 and ss.ss_hash <= 959 and c.c_hash >= 281 and c.c_hash <= 681 and hd.hd_hash >= 358 and hd.hd_hash <= 691
;
