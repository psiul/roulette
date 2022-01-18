select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and c.c_hash >= 23 and c.c_hash <= 423 and hd.hd_hash >= 41 and hd.hd_hash <= 374 and i.i_hash >= 123 and i.i_hash <= 873
;
