select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 578 and ss.ss_hash <= 911 and hd.hd_hash >= 326 and hd.hd_hash <= 726 and d.d_hash >= 123 and d.d_hash <= 873
;
