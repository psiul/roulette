select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 358 and ss.ss_hash <= 691 and hd.hd_hash >= 19 and hd.hd_hash <= 769 and c.c_hash >= 548 and c.c_hash <= 948
;
