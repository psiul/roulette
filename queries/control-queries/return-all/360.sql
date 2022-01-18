select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 387 and i.i_hash <= 720 and hd.hd_hash >= 181 and hd.hd_hash <= 931 and c.c_hash >= 474 and c.c_hash <= 874
;
