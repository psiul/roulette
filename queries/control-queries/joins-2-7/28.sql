select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 672 and ss.ss_hash <= 872 and i.i_hash >= 198 and i.i_hash <= 698
;