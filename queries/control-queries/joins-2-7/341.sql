select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 709 and ss.ss_hash <= 909 and i.i_hash >= 276 and i.i_hash <= 776
;
