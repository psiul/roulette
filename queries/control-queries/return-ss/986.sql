select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 197 and ss.ss_hash <= 530 and i.i_hash >= 200 and i.i_hash <= 950 and hd.hd_hash >= 134 and hd.hd_hash <= 534
;
