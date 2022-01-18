select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 524 and ss.ss_hash <= 857 and d.d_hash >= 2 and d.d_hash <= 402 and hd.hd_hash >= 162 and hd.hd_hash <= 912
;
