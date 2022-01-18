select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 207 and ss.ss_hash <= 957 and hd.hd_hash >= 230 and hd.hd_hash <= 630 and c.c_hash >= 490 and c.c_hash <= 823
;
