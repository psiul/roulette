select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 197 and ss.ss_hash <= 530 and d.d_hash >= 272 and d.d_hash <= 672 and i.i_hash >= 21 and i.i_hash <= 771
;
