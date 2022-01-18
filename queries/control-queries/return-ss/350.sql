select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 117 and ss.ss_hash <= 517 and c.c_hash >= 96 and c.c_hash <= 846 and hd.hd_hash >= 530 and hd.hd_hash <= 863
;
