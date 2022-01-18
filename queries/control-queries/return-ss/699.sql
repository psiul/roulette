select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 5 and ss.ss_hash <= 755 and d.d_hash >= 473 and d.d_hash <= 873 and hd.hd_hash >= 302 and hd.hd_hash <= 635
;
