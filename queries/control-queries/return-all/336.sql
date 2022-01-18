select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 601 and ss.ss_hash <= 934 and c.c_hash >= 178 and c.c_hash <= 578 and d.d_hash >= 197 and d.d_hash <= 947
;
