select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 110 and ss.ss_hash <= 443 and i.i_hash >= 183 and i.i_hash <= 933 and d.d_hash >= 495 and d.d_hash <= 895
;
